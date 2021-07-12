using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LeQuangDuy_181203460.Models;
using PagedList;

namespace LeQuangDuy_181203460.Controllers
{
    public class BaiThiController : Controller
    {
        // GET: BaiThi
        public ActionResult Index()
        {
            return View();
        }


        // GET: HangHoas/Create
        public ActionResult Create()
        {
            Models.ModelBanHang db = new Models.ModelBanHang();

            ViewBag.MaLoai = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHang,MaLoai,TenHang,Gia,Anh")] HangHoa hangHoa)
        {
            Models.ModelBanHang db = new Models.ModelBanHang();

            if (ModelState.IsValid)
            {
                db.HangHoas.Add(hangHoa);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoai = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        // GET: HangHoas/Edit/5
        public ActionResult Edit(int? id)
        {
            Models.ModelBanHang db = new Models.ModelBanHang();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangHoa hangHoa = db.HangHoas.Find(id);
            if (hangHoa == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoai = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }


        // GET: HangHoas/Details/5
        public ActionResult Details(int? id)
        {

            Models.ModelBanHang db = new Models.ModelBanHang();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangHoa hangHoa = db.HangHoas.Find(id);

            if (hangHoa == null)
            {
                return HttpNotFound();
            }
            return View(hangHoa);
        }


        public ActionResult RenderNav()
        {
            Models.ModelBanHang modelBanHang = new Models.ModelBanHang();

            var list = modelBanHang.LoaiHangs.ToList();

            return PartialView("LeQuangDuy_Header",list);
        }

        public ActionResult Product(int ?page)
        {
            if (page == null)
            {
                page = 1;
            }
               
            Models.ModelBanHang modelBanHang = new Models.ModelBanHang();

            var list = modelBanHang.HangHoas.Where(f=>f.Gia>=100).ToList();

            int pageSize = 3;

            int pageNumber = (page ?? 1);

            return PartialView("LeQuangDuy_MainContent",list.ToPagedList(pageNumber, pageSize));

        }

        public ActionResult LoadProductByCatId(int CatId, int ?page)
        {
            Models.ModelBanHang modelBanHang = new Models.ModelBanHang();

            var list = modelBanHang.HangHoas.Where(f => f.MaLoai == CatId).ToList();

            int pageSize = 3;

            int pageNumber = (page ?? 1);


            //return PartialView("LeQuangDuy_MainContent", list);
            return PartialView("LeQuangDuy_MainContent", list.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult SearchProduct(String nameProduct, int ?page)
        {
            Models.ModelBanHang modelBanHang = new Models.ModelBanHang();

            var list = modelBanHang.HangHoas.Where(f => f.TenHang.Contains(nameProduct.Trim())).ToList();

            int pageSize = 3;

            int pageNumber = (page ?? 1);


            return PartialView("LeQuangDuy_MainContent", list.ToPagedList(pageNumber, pageSize));
            //return PartialView("LeQuangDuy_MainContent", list);
        }

    }
}