﻿using TAB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using PagedList.Core;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace TAB.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly EcommerceVer2Context _context;

        public HomeController(ILogger<HomeController> logger, EcommerceVer2Context context)
        {
            _context = context;
            _logger = logger;
        }

        public ActionResult Index()
        {
            var lstNewProduct = _context.Products
                .Include(n => n.Cate)
                .Where(n => n.IsActived && n.UnitInStock > 5)
                .OrderByDescending(n => n.DateCreated);
            ViewBag.ListNPD = lstNewProduct;

            var lstBestSeller = _context.Products
                .Include(n => n.Cate)
                .Include(n=>n.OrderDetails)
                .Where(n => n.IsActived && n.UnitInStock > 5 && n.IsBestsellers == true)
                .OrderByDescending(n => n.DateCreated);
            ViewBag.BestSeller = lstBestSeller;
            return View();
        }

        public ActionResult NPPartial()
        {
            return PartialView();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [Route("CauLongColection.html", Name = "CauLongColection")]
        public IActionResult CauLongColection(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstCauLong = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a => a.IsActived && a.UnitInStock > 0 && a.Cate.CategoryName == "Caulong" && a.Homeflag == true)
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);
            PagedList<Product> model = new PagedList<Product>(lstCauLong, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;
            return View(model);
        }

        [Route("PhuKienColection.html", Name = "PhuKienColection")]
        public IActionResult PhuKienColection(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstPhuKien = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a => a.IsActived && a.Cate.CategoryName == "PhuKien" && a.UnitInStock > 0 && a.Homeflag == true)
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);
            PagedList<Product> model = new PagedList<Product>(lstPhuKien, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;
            return View(model);
        }

        [Route("VotColection.html", Name = "VotColection")]
        public IActionResult VotColection(int? page)
        {
            var pageNo = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 6;
            var lstVot = _context.Products
                .AsNoTracking()
                .Include(a => a.Cate)
                .Where(a => a.IsActived && a.UnitInStock > 0 && a.Cate.CategoryName == "Votcaulong" && a.Homeflag == true)
                .Include(a => a.Brand)
                .OrderByDescending(a => a.DateCreated);
            PagedList<Product> model = new PagedList<Product>(lstVot, pageNo, pageSize);
            ViewBag.CurrentPage = pageNo;
            return View(model);
        }

    }
}
