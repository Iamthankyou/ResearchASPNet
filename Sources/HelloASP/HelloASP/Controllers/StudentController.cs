﻿using HelloASP.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace HelloASP.Controllers
{
    public class StudentController : Controller
    {
        private Model1 db = new Model1();

        // GET: Student
        public ActionResult Index(string sortOrder, string searchString, int? page)
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

            int pageSize = 3;
            int pageNumber = (page ?? 1);
            
            return View(students.ToPagedList(pageNumber,pageSize));
        }

        // Get
        public ActionResult AddStudentCourse()
        {
            ViewBag.idGenerate = getId();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddStudentCourse([Bind(Include =("StudentCourseId,CourseId,StudentId"))] Student_Course studentCourse)
        {
            try
            {
                db.Student_Course.Add(studentCourse);
                db.SaveChanges();
            }
            catch (DataException)
            {
                ModelState.AddModelError("", "Can't add link");
            }

            return View(studentCourse);
        }

        // Get
        public ActionResult CreateCourse()
        {
            return View();
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Student student = db.Students.Find(id);

            ViewBag.tmp = student.Student_Course.ToList().Count ;

            foreach(var i in student.Student_Course)
            {
                ViewBag.tmp = i.Course.Title.ToString();
            }

            if (student == null)
            {
                return HttpNotFound();
            }

            return View(student);
        }

        // FOR GET
        public ActionResult Create()
        {
            ViewBag.idGenerate = getId();

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateCourse([Bind(Include=("CourseId,Title,Credit"))] Course course)
        {
            try
            {
                db.Courses.Add(course);
                db.SaveChanges();
            }
            catch (DataException)
            {
                ModelState.AddModelError("", "Can't create course");
            }

            return View(course);
        }

        private string getId()
        {
            string res = DateTime.Now.Day.ToString()+DateTime.Now.Month.ToString()+DateTime.Now.Minute.ToString()+DateTime.Now.Millisecond.ToString()+DateTime.Now.Hour.ToString();
            return res;
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