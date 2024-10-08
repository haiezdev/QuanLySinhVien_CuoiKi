﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using QuanLySinhVien_CuoiKi.Models;

namespace QuanLySinhVien_CuoiKi.Controllers
{
    public class LopSinhHoatsController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public LopSinhHoatsController(QuanLySinhVienCuoiKiContext context)
        {
            _context = context;
        }
        public ActionResult TimKiem(string searchTerm)
        {
            return RedirectToAction("Index", new { searchTerm });
        }

        // GET: GiaoViens
        public async Task<IActionResult> Index(string searchTerm)
        {
            IQueryable<LopSinhHoat> lopSinhHoats = _context.LopSinhHoats.Include(h => h.MaKhoaNavigation);
            if (!string.IsNullOrEmpty(searchTerm))
            {

                lopSinhHoats = lopSinhHoats.Where(s => s.MaLopSh.Contains(searchTerm) || s.TenLopSh.Contains(searchTerm) ||
                                            s.MaKhoa.Contains(searchTerm));
                int count = await lopSinhHoats.CountAsync();
                ViewBag.Count = count;
                ViewBag.SearchTerm = searchTerm;
            }
            return View(lopSinhHoats);
        }

        //// GET: LopSinhHoats
        //public async Task<IActionResult> Index()
        //{
        //    var quanLySinhVienCuoiKiContext = _context.LopSinhHoats.Include(l => l.MaKhoaNavigation);
        //    return View(await quanLySinhVienCuoiKiContext.ToListAsync());
        //}

        // GET: LopSinhHoats/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var lopSinhHoat = await _context.LopSinhHoats
                .Include(l => l.MaKhoaNavigation)
                .FirstOrDefaultAsync(m => m.MaLopSh == id);
            if (lopSinhHoat == null)
            {
                return NotFound();
            }

            return View(lopSinhHoat);
        }

        // GET: LopSinhHoats/Create
        public IActionResult Create()
        {
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa");
            return View();
        }

        // POST: LopSinhHoats/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaLopSh,TenLopSh,MaKhoa")] LopSinhHoat lopSinhHoat)
        {
            if (_context.LopSinhHoats.Any(s => s.MaLopSh == lopSinhHoat.MaLopSh))
            {
                ModelState.AddModelError("MaLopSh", "Mã lớp sinh hoạt đã tồn tại.");
            }
            if (ModelState.IsValid)
            {
                _context.Add(lopSinhHoat);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", lopSinhHoat.MaKhoa);
            return View(lopSinhHoat);
        }

        // GET: LopSinhHoats/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var lopSinhHoat = await _context.LopSinhHoats.FindAsync(id);
            if (lopSinhHoat == null)
            {
                return NotFound();
            }
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", lopSinhHoat.MaKhoa);
            return View(lopSinhHoat);
        }

        // POST: LopSinhHoats/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(string id, [Bind("MaLopSh,TenLopSh,MaKhoa")] LopSinhHoat lopSinhHoat)
        //{
        //    if (id != lopSinhHoat.MaLopSh)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(lopSinhHoat);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!LopSinhHoatExists(lopSinhHoat.MaLopSh))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", lopSinhHoat.MaKhoa);
        //    return View(lopSinhHoat);
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaLopSh,TenLopSh,MaKhoa")] LopSinhHoat lopSinhHoat)
        {
            if (id != lopSinhHoat.MaLopSh)
            {
                return NotFound();
            }

            // Kiểm tra mã lớp sinh hoạt mới nếu nó thay đổi
            var existingLopSinhHoat = await _context.LopSinhHoats.AsNoTracking().FirstOrDefaultAsync(l => l.MaLopSh == id);
            if (existingLopSinhHoat == null)
            {
                return NotFound();
            }

            if (existingLopSinhHoat.MaLopSh != lopSinhHoat.MaLopSh && _context.LopSinhHoats.Any(l => l.MaLopSh == lopSinhHoat.MaLopSh))
            {
                ModelState.AddModelError("MaLopSh", "Mã lớp sinh hoạt đã tồn tại.");
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(lopSinhHoat);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!LopSinhHoatExists(lopSinhHoat.MaLopSh))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", lopSinhHoat.MaKhoa);
            return View(lopSinhHoat);
        }

        // GET: LopSinhHoats/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var lopSinhHoat = await _context.LopSinhHoats
                .Include(l => l.MaKhoaNavigation)
                .FirstOrDefaultAsync(m => m.MaLopSh == id);
            if (lopSinhHoat == null)
            {
                return NotFound();
            }

            return View(lopSinhHoat);
        }

        // POST: LopSinhHoats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var lopSinhHoat = await _context.LopSinhHoats.FindAsync(id);
            if (lopSinhHoat != null)
            {
                _context.LopSinhHoats.Remove(lopSinhHoat);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool LopSinhHoatExists(string id)
        {
            return _context.LopSinhHoats.Any(e => e.MaLopSh == id);
        }
    }
}
