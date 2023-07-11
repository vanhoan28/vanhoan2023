using ASPWeb.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASPWeb.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();

        public ActionResult Index(string SearchString)
        {
            var lstProduct = objWebEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();
            return View(lstProduct);
        }
        public ActionResult Detail(int id)
        {
            var objProduct= objWebEntities.Products.Where(n=>n.ID == id).FirstOrDefault();
            return View(objProduct);
        }
       
    }
}