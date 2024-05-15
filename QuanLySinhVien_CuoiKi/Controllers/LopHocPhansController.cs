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
    public class LopHocPhansController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public LopHocPhansController(QuanLySinhVienCuoiKiContext context)
        {
            _context = context;
        }

        // GET: LopHocPhans
        public async Task<IActionResult> Index()
        {
            var quanLySinhVienCuoiKiContext = _context.LopHocPhans.Include(l => l.MaHocPhanNavigation).Include(l => l.MaSvNavigation);
            return View(await quanLySinhVienCuoiKiContext.ToListAsync());
        }

        // GET: LopHocPhans/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var lopHocPhan = await _context.LopHocPhans
                .Include(l => l.MaHocPhanNavigation)
                .Include(l => l.MaSvNavigation)
                .FirstOrDefaultAsync(m => m.MaSv == id);
            if (lopHocPhan == null)
            {
                return NotFound();
            }

            return View(lopHocPhan);
        }

        // GET: LopHocPhans/Create
        public IActionResult Create()
        {
            ViewData["MaHocPhan"] = new SelectList(_context.HocPhans, "MaHocPhan", "MaHocPhan");
            ViewData["MaSv"] = new SelectList(_context.SinhViens, "MaSv", "MaSv");
            return View();
        }

        // POST: LopHocPhans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaSv,MaHocPhan,Diem")] LopHocPhan lopHocPhan)
        {
            if (ModelState.IsValid)
            {
                _context.Add(lopHocPhan);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaHocPhan"] = new SelectList(_context.HocPhans, "MaHocPhan", "MaHocPhan", lopHocPhan.MaHocPhan);
            ViewData["MaSv"] = new SelectList(_context.SinhViens, "MaSv", "MaSv", lopHocPhan.MaSv);
            return View(lopHocPhan);
        }

        // GET: LopHocPhans/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var lopHocPhan = await _context.LopHocPhans.FindAsync(id);
            if (lopHocPhan == null)
            {
                return NotFound();
            }
            ViewData["MaHocPhan"] = new SelectList(_context.HocPhans, "MaHocPhan", "MaHocPhan", lopHocPhan.MaHocPhan);
            ViewData["MaSv"] = new SelectList(_context.SinhViens, "MaSv", "MaSv", lopHocPhan.MaSv);
            return View(lopHocPhan);
        }

        // POST: LopHocPhans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaSv,MaHocPhan,Diem")] LopHocPhan lopHocPhan)
        {
            if (id != lopHocPhan.MaSv)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(lopHocPhan);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!LopHocPhanExists(lopHocPhan.MaSv))
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
            ViewData["MaHocPhan"] = new SelectList(_context.HocPhans, "MaHocPhan", "MaHocPhan", lopHocPhan.MaHocPhan);
            ViewData["MaSv"] = new SelectList(_context.SinhViens, "MaSv", "MaSv", lopHocPhan.MaSv);
            return View(lopHocPhan);
        }

        // GET: LopHocPhans/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var lopHocPhan = await _context.LopHocPhans
                .Include(l => l.MaHocPhanNavigation)
                .Include(l => l.MaSvNavigation)
                .FirstOrDefaultAsync(m => m.MaSv == id);
            if (lopHocPhan == null)
            {
                return NotFound();
            }

            return View(lopHocPhan);
        }

        // POST: LopHocPhans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var lopHocPhan = await _context.LopHocPhans.FindAsync(id);
            if (lopHocPhan != null)
            {
                _context.LopHocPhans.Remove(lopHocPhan);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool LopHocPhanExists(string id)
        {
            return _context.LopHocPhans.Any(e => e.MaSv == id);
        }
    }
}
