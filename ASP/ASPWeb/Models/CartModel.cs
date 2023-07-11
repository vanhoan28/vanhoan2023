using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASPWeb.Context;

namespace ASPWeb.Models
{
    public class CartModel
    {
        public Product Product {get; set;}
        public int Quanitty { get; set; }
    }
}