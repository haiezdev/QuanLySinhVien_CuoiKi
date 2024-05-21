using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using QuanLySinhVien_CuoiKi.Models;

namespace QuanLySinhVien_CuoiKi.Controllers
{
    public class GiaoViensController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public GiaoViensController(QuanLySinhVienCuoiKiContext context)
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
            IQueryable<GiaoVien> giaoViens = _context.GiaoViens.Include(gv => gv.MaKhoaNavigation);
            if (!string.IsNullOrEmpty(searchTerm))
            {
               
                giaoViens = giaoViens.Where(s => s.MaGv.Contains(searchTerm) || s.TenGv.Contains(searchTerm) ||
                                            s.Email.Contains(searchTerm) ||
                                            s.SoDienThoai.Contains(searchTerm) || s.BoMon.Contains(searchTerm) ||
                                            s.MaKhoa.Contains(searchTerm));
                int count = await giaoViens.CountAsync();
                ViewBag.Count = count;
                ViewBag.SearchTerm = searchTerm;
            }
            return View(giaoViens);
        }

        // GET: GiaoViens/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var giaoVien = await _context.GiaoViens
                .Include(g => g.MaKhoaNavigation)
                .FirstOrDefaultAsync(m => m.MaGv == id);
            if (giaoVien == null)
            {
                return NotFound();
            }

            return View(giaoVien);
        }

        // GET: GiaoViens/Create
        public IActionResult Create()
        {
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa");
            return View();
        }

        // POST: GiaoViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaGv,TenGv,Email,SoDienThoai,BoMon,MaKhoa")] GiaoVien giaoVien)
        {
            if (_context.GiaoViens.Any(g => g.MaGv == giaoVien.MaGv))
            {
                ModelState.AddModelError("MaGv", "Mã giáo viên đã tồn tại.");
            }

            if (ModelState.IsValid)
            {
                _context.Add(giaoVien);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", giaoVien.MaKhoa);
            return View(giaoVien);
        }

        // GET: GiaoViens/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var giaoVien = await _context.GiaoViens.FindAsync(id);
            if (giaoVien == null)
            {
                return NotFound();
            }
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", giaoVien.MaKhoa);
            return View(giaoVien);
        }

        // POST: GiaoViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(string id, [Bind("MaGv,TenGv,Email,SoDienThoai,BoMon,MaKhoa")] GiaoVien giaoVien)
        //{
        //    if (id != giaoVien.MaGv)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(giaoVien);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!GiaoVienExists(giaoVien.MaGv))
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
        //    ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", giaoVien.MaKhoa);
        //    return View(giaoVien);
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaGv,TenGv,Email,SoDienThoai,BoMon,MaKhoa")] GiaoVien giaoVien)
        {
            if (id != giaoVien.MaGv)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Check if the new teacher code already exists in the system and is not the current teacher
                    var existingGiaoVien = await _context.GiaoViens.AsNoTracking().FirstOrDefaultAsync(gv => gv.MaGv == giaoVien.MaGv);
                    if (existingGiaoVien != null && existingGiaoVien.MaGv != id)
                    {
                        ModelState.AddModelError("MaGv", "Mã giáo viên đã tồn tại.");
                        ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", giaoVien.MaKhoa);
                        return View(giaoVien);
                    }

                    _context.Update(giaoVien);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GiaoVienExists(giaoVien.MaGv))
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
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "TenKhoa", giaoVien.MaKhoa);
            return View(giaoVien);
        }


        // GET: GiaoViens/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var giaoVien = await _context.GiaoViens
                .Include(g => g.MaKhoaNavigation)
                .FirstOrDefaultAsync(m => m.MaGv == id);
            if (giaoVien == null)
            {
                return NotFound();
            }

            return View(giaoVien);
        }

        // POST: GiaoViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var giaoVien = await _context.GiaoViens.FindAsync(id);
            if (giaoVien != null)
            {
                _context.GiaoViens.Remove(giaoVien);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GiaoVienExists(string id)
        {
            return _context.GiaoViens.Any(e => e.MaGv == id);
        }
    }
}
