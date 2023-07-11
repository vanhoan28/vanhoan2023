using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ASPWeb.Models
{
    public partial class ProductMasterData
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Avarta { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public string ShortDes { get; set; }
        public string FullDescription { get; set; }
        public Nullable<double> Price { get; set; }
        public Nullable<int> TypeID { get; set; }
        public string Slug { get; set; }
        public Nullable<int> BrandID { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public Nullable<bool> ShowOnHomePage { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
    }
}