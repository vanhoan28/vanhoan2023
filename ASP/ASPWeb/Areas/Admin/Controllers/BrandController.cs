using ASPWeb.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASPWeb.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        // GET: Admin/Brand
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();
        public ActionResult Index()
        {
            var lstBrand=objWebEntities.Brands.ToList();
            return View(lstBrand);
        }
        
        // GET: Admin/Category
        [HttpGet]
        public ActionResult Create()
        {
            //Common objCommon = new Common();
            //var lstCat = objWebEntities.Categories.ToList();
            ////convert select sang dạng value , text
            //ListtoDataTableConverter converter = new ListtoDataTableConverter();
            //DataTable dtCategory = converter.ToDataTable(lstCat);
            //ViewBag.ListCategory = objCommon.ToSelectList(dtCategory, "ID", "Name");

            //var lstBrand = objWebEntities.Brands.ToList();
            //DataTable dtBrand = converter.ToDataTable(lstBrand);
            //ViewBag.ListBrand = objCommon.ToSelectList(dtBrand, "ID", "Name");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Brand objBrand)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    if (objBrand.ImageUpLoad != null)
                    {
                        string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpLoad.FileName);
                        string extension = Path.GetExtension(objBrand.ImageUpLoad.FileName);
                        fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                        objBrand.Avarta = fileName;
                        string imageSavePath = Server.MapPath("/Content/images/") + fileName;
                        //objBrand.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                        objBrand.ImageUpLoad.SaveAs(imageSavePath);
                    }
                    objWebEntities.Brands.Add(objBrand);
                    objWebEntities.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return View();
            }

        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objBrand = objWebEntities.Brands.Where(n => n.ID == id).FirstOrDefault();
            return View(objBrand);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objBrand = objWebEntities.Brands.Where(n => n.ID == id).FirstOrDefault();

            return View(objBrand);
        }
        [HttpPost]
        public ActionResult Delete(Brand objBra)
        {
            var objBrand = objWebEntities.Brands.Where(n => n.ID == objBra.ID).FirstOrDefault();
            objWebEntities.Brands.Remove(objBrand);
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objBrand = objWebEntities.Brands.Where(n => n.ID == id).FirstOrDefault();

            return View(objBrand);
        }
        [HttpPost]
        public ActionResult Edit(Brand objBra)
        {
            if (objBra.ImageUpLoad != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objBra.ImageUpLoad.FileName);
                string extension = Path.GetExtension(objBra.ImageUpLoad.FileName);
                fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                objBra.Avarta = fileName;
                objBra.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
            }
            objWebEntities.Entry(objBra).State = EntityState.Modified;
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}