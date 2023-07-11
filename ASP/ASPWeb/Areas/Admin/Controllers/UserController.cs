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
    public class UserController : Controller
    {
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();
        // GET: Admin/User
        public ActionResult Index()
        {
            var lstUser=objWebEntities.Users.ToList();
            return View(lstUser);
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
        public ActionResult Create(User objUser)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    
                    objWebEntities.Users.Add(objUser);
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
            var objUser = objWebEntities.Users.Where(n => n.ID == id).FirstOrDefault();
            return View(objUser);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objUser = objWebEntities.Users.Where(n => n.ID == id).FirstOrDefault();

            return View(objUser);
        }
        [HttpPost]
        public ActionResult Delete(User objUs)
        {
            var objUser = objWebEntities.Users.Where(n => n.ID == objUs.ID).FirstOrDefault();
            objWebEntities.Users.Remove(objUser);
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objUser = objWebEntities.Users.Where(n => n.ID == id).FirstOrDefault();

            return View(objUser);
        }
        [HttpPost]
        public ActionResult Edit(User objUser)
        {
            objWebEntities.Entry(objUser).State = EntityState.Modified;
            objWebEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}