using ASPWeb.Context;
using ASPWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASPWeb.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();
        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();
            objHomeModel.ListCategory = objWebEntities.Categories.ToList();
            //objHomeModel.ListProduct = objWebEntities.Products.ToList();
            return View(objHomeModel);
        }
        public ActionResult ProductCategory(int id)
        {
            var lstProduct= objWebEntities.Products.Where(n=>n.CategoryID==id).ToList();
            return View(lstProduct);
        }
    }
}