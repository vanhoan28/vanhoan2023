using ASPWeb.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPWeb.Context;
using ASPWeb.Models;

namespace ASPWeb.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment

        QLSANPHAMWEBEntities objWebEntities = new QLSANPHAMWEBEntities();

        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                var lstCart = (List<CartModel>)Session["cart"];
                Order objOrder = new Order();
                objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.ProductID = int.Parse(Session["idUser"].ToString());
                //foreach (var cart in lstCart)
                //{
                //    objOrder.Price += float.Parse(Session["price"].ToString());
                //}
                objOrder.CreateOnUtc = DateTime.Now;
                objOrder.Status = 1;
                objWebEntities.Orders.Add(objOrder);
                objWebEntities.SaveChanges();

                int intOrderId = objOrder.ID;

                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                foreach (var item in lstCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quanitty;
                    obj.OrderID = intOrderId;
                    obj.ProductID = item.Product.ID;                  
                    lstOrderDetail.Add(obj);
                }
                objWebEntities.OrderDetails.AddRange(lstOrderDetail);
                objWebEntities.SaveChanges();
            }
            return View();
        }
    }
    
}