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

        // GET: GiaoViens
        public async Task<IActionResult> Index()
        {
            var quanLySinhVienCuoiKiContext = _context.GiaoViens.Include(g => g.MaKhoaNavigation);
            return View(await quanLySinhVienCuoiKiContext.ToListAsync());
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
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", giaoVien.MaKhoa);
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
