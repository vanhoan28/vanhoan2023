using ASPWeb.Context;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static ASPWeb.Common;

namespace ASPWeb.Areas.Admin.Controllers
{
  
    public class CategoryController : Controller
    {
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();
        // GET: Admin/Category
        public ActionResult Index()
        {
            var lstCategory = objWebEntities.Categories.ToList();
            return View(lstCategory);
        }
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
        public ActionResult Create(Category objCategory)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (objCategory.ImageUpLoad != null)
                    {
                        string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpLoad.FileName);
                        string extension = Path.GetExtension(objCategory.ImageUpLoad.FileName);
                        fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                        objCategory.Avarta = fileName;
                        objCategory.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));

                    }
                    objWebEntities.Categories.Add(objCategory);
                    objWebEntities.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }

        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objCategory = objWebEntities.Categories.Where(n => n.ID == id).FirstOrDefault();
            return View(objCategory);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objCategory = objWebEntities.Categories.Where(n => n.ID == id).FirstOrDefault();

            return View(objCategory);
        }
        [HttpPost]
        public ActionResult Delete(Category objCat)
        {
            var objCategory = objWebEntities.Categories.Where(n => n.ID == objCat.ID).FirstOrDefault();
            objWebEntities.Categories.Remove(objCategory);
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objCategory = objWebEntities.Categories.Where(n => n.ID == id).FirstOrDefault();

            return View(objCategory);
        }
        [HttpPost]
        public ActionResult Edit(Category objCat)
        {
            if (objCat.ImageUpLoad != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objCat.ImageUpLoad.FileName);
                string extension = Path.GetExtension(objCat.ImageUpLoad.FileName);
                fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                objCat.Avarta = fileName;
                objCat.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
            }
            objWebEntities.Entry(objCat).State = EntityState.Modified;
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}