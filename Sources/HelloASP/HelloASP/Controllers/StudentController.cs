using HelloASP.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace HelloASP.Controllers
{
    public class StudentController : Controller
    {
        private Model1 db = new Model1();

        // GET: Student
        public ActionResult Index(string sortOrder, string searchString)
        {
            var students = from i in db.Students  select i;

            ViewBag.nameSort = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.dateSort = sortOrder == "Date" ? "date_desc" : "Date";

            ViewBag.currentSearch = "";

            if (!string.IsNullOrEmpty(searchString))
            {
                students = students.Where(u => u.LastName.Contains(searchString) || u.FisrtName.Contains(searchString));
                ViewBag.currentSearch = searchString;
            }

            switch (sortOrder)
            {
                case "name_desc":
                    students = students.OrderByDescending(s => s.FisrtName);
                    break;
                case "date_desc":
                    students = students.OrderByDescending(s => s.Grade);
                    break;
                case "Date":
                    students = students.OrderBy(s => s.Grade);
                    break;
                default:
                    students = students.OrderBy(s => s.FisrtName);
                    break;
            }
            
            return View(students.ToList());
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Student student = db.Students.Find(id);

            if (student == null)
            {
                return HttpNotFound();
            }

            return View(student);
        }

        // FOR GET
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create ([Bind(Include="StudentId,FisrtName,LastName,Grade")]Student student)
        {
            try
            {
                db.Students.Add(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (DataException)
            {
                ModelState.AddModelError("", "Unable to save changes. ");
            }

            return View(student);
        }

        // FOR GET
        public ActionResult Edit(String id)
        {
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }

            return View(student);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPost(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Student student = db.Students.Find(id);

            if (TryUpdateModel(student,"",new string[] { "FisrtName", "LastName", "Grade" }))
            {
                try
                {
                    db.SaveChanges();
                }
                catch (DataException)
                {
                    ModelState.AddModelError("", "Unable to save changes. ");
                }
            }

            return View(student);
        }

        public ActionResult Delete(string id, bool? saveChangeError = false)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            if (saveChangeError.GetValueOrDefault())
            {
                ViewBag.ErrorMessage = "Delete failed!";
            }

            Student student = db.Students.Find(id);

            if (student == null)
            {
                return HttpNotFound();
            }

            return View(student);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(string id)
        {
            try
            {
                Student student = db.Students.Find(id);
                db.Students.Remove(student);
                db.SaveChanges();
            }
            catch (RetryLimitExceededException)
            {
                return RedirectToAction("Delete", new { id = id, saveChangeError = true });
            }
           
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            
            base.Dispose(disposing);
        }
    }
}