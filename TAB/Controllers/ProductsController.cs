﻿using TAB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TAB.Controllers
{
    public class ProductsController : Controller
    {
        private readonly EcommerceVer2Context _context;

        public ProductsController(EcommerceVer2Context context)
        {
            _context = context;
        }

        [Route("Votcaulong.html", Name = "Votcaulong")]
        public IActionResult Index(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstVot = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a=>a.IsActived && a.UnitInStock >0 && a.CateId == 1)
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);
            PagedList<Product> model = new PagedList<Product>(lstVot, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;
            return View(model);
        }

        [Route("CauLong.html", Name = "CauLong")]
        public IActionResult CauLong(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstCauLong = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a => a.IsActived && a.UnitInStock > 0 && a.Cate.CategoryName == "Caulong")  // Thay đổi tên category nếu cần
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);

            PagedList<Product> model = new PagedList<Product>(lstCauLong, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;

            return View(model);
        }



        [Route("Sales.html", Name = "Sales")]
        public IActionResult Sales(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstSale = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a => a.IsActived && a.Discount > 0 && a.UnitInStock > 0)
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);
            PagedList<Product> model = new PagedList<Product>(lstSale, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;
            return View(model);
        }

        [Route("PhuKien.html", Name = "PhuKien")]
        public IActionResult PhuKien(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstPhuKien = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a => a.IsActived && a.Cate.CategoryName == "Phukien" && a.UnitInStock > 0)
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);
            PagedList<Product> model = new PagedList<Product>(lstPhuKien, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;
            return View(model);
        }



        [Route("/{Alias}-{id}.html", Name = "Details")]
        public IActionResult Details(int id)
        {
            var product = _context.Products.Include(a => a.Cate).Include(a => a.Brand).FirstOrDefault(x => x.ProductId == id);
            if(product == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View(product);
            }
        }

        public IActionResult Search( string searchStr, int? page)
        {
            var _product = from m in _context.Products.Include(p => p.Brand).Include(p => p.Cate) select m;
            
            //Search
            ViewData["CurrentFilter"] = searchStr;
            if (!String.IsNullOrEmpty(searchStr))
            {
                _product = _product.Where(p => p.ProductName.Contains(searchStr) || p.ProductId.ToString().Contains(searchStr));
            }
            //Paginate
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 5;
            PagedList<Product> models = new PagedList<Product>(_product, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;

            return View(models);
        }
    }
}
