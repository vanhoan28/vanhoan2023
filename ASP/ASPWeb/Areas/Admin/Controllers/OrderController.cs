using ASPWeb.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASPWeb.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();
        // GET: Admin/Order
        public ActionResult Index()
        {
            var lstOrder = objWebEntities.Orders.ToList();
            return View(lstOrder);
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
        public ActionResult Create(Order objOrder)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    objWebEntities.Orders.Add(objOrder);
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
            var objOrder = objWebEntities.Orders.Where(n => n.ID == id).FirstOrDefault();
            return View(objOrder);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objOrder = objWebEntities.Orders.Where(n => n.ID == id).FirstOrDefault();

            return View(objOrder);
        }
        [HttpPost]
        public ActionResult Delete(Order objOrd)
        {
            var objOrder = objWebEntities.Orders.Where(n => n.ID == objOrd.ID).FirstOrDefault();
            objWebEntities.Orders.Remove(objOrder);
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objOrder = objWebEntities.Orders.Where(n => n.ID == id).FirstOrDefault();

            return View(objOrder);
        }
        [HttpPost]
        public ActionResult Edit(Order objOrder)
        {
            objWebEntities.Entry(objOrder).State = EntityState.Modified;
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}