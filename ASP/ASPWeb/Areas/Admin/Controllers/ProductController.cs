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
    public class ProductController : Controller
    {
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();
        // GET: Admin/Product
        public ActionResult Index()
        {
            var lstProduct = objWebEntities.Products.ToList();
            return View(lstProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            Common objCommon=new Common();
            var lstCat = objWebEntities.Categories.ToList();
            //convert select sang dạng value , text
            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable dtCategory = converter.ToDataTable(lstCat);
            ViewBag.ListCategory = objCommon.ToSelectList(dtCategory, "ID", "Name");

            var lstBrand=objWebEntities.Brands.ToList();
            DataTable dtBrand=converter.ToDataTable(lstBrand);
            ViewBag.ListBrand = objCommon.ToSelectList(dtBrand, "ID", "Name");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (objProduct.ImageUpLoad != null)
                    {
                        string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpLoad.FileName);
                        string extension = Path.GetExtension(objProduct.ImageUpLoad.FileName);
                        fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                        objProduct.Avarta = fileName;
                        objProduct.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                        
                    }
                    objWebEntities.Products.Add(objProduct);
                    objWebEntities.SaveChanges();
                }
                
                return RedirectToAction("Index");
            }
            catch (Exception )
            {
                return RedirectToAction("Index");
            }
            
        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objProduct=objWebEntities.Products.Where(n=>n.ID==id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objProduct = objWebEntities.Products.Where(n => n.ID == id).FirstOrDefault();
            
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objWebEntities.Products.Where(n => n.ID == objPro.ID).FirstOrDefault();
            objWebEntities.Products.Remove(objProduct);
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objProduct = objWebEntities.Products.Where(n => n.ID == id).FirstOrDefault();

            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Edit(Product objPro)
        {
            if (objPro.ImageUpLoad != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objPro.ImageUpLoad.FileName);
                string extension = Path.GetExtension(objPro.ImageUpLoad.FileName);
                fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                objPro.Avarta = fileName;
                objPro.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
            }
            objWebEntities.Entry(objPro).State=EntityState.Modified;
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}