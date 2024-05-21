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
    public class KhoasController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public KhoasController(QuanLySinhVienCuoiKiContext context)
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
            IQueryable<Khoa> khoas = _context.Khoas.Include(h => h.MaTruongNavigation);
            if (!string.IsNullOrEmpty(searchTerm))
            {

                khoas = khoas.Where(s => s.MaKhoa.Contains(searchTerm) || s.TenKhoa.Contains(searchTerm) ||
                                            s.MaTruong.Contains(searchTerm));
                int count = await khoas.CountAsync();
                ViewBag.Count = count;
                ViewBag.SearchTerm = searchTerm;
            }
            return View(khoas);
        }

        // GET: Khoas
        //public async Task<IActionResult> Index()
        //{
        //    var quanLySinhVienCuoiKiContext = _context.Khoas.Include(k => k.MaTruongNavigation);
        //    return View(await quanLySinhVienCuoiKiContext.ToListAsync());
        //}

        // GET: Khoas/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var khoa = await _context.Khoas
                .Include(k => k.MaTruongNavigation)
                .FirstOrDefaultAsync(m => m.MaKhoa == id);
            if (khoa == null)
            {
                return NotFound();
            }

            return View(khoa);
        }

        // GET: Khoas/Create
        public IActionResult Create()
        {
            ViewData["MaTruong"] = new SelectList(_context.Truongs, "MaTruong", "MaTruong");
            return View();
        }

        // POST: Khoas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaKhoa,TenKhoa,MaTruong")] Khoa khoa)
        {
            if (ModelState.IsValid)
            {
                _context.Add(khoa);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaTruong"] = new SelectList(_context.Truongs, "MaTruong", "MaTruong", khoa.MaTruong);
            return View(khoa);
        }

        // GET: Khoas/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var khoa = await _context.Khoas.FindAsync(id);
            if (khoa == null)
            {
                return NotFound();
            }
            ViewData["MaTruong"] = new SelectList(_context.Truongs, "MaTruong", "MaTruong", khoa.MaTruong);
            return View(khoa);
        }

        // POST: Khoas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaKhoa,TenKhoa,MaTruong")] Khoa khoa)
        {
            if (id != khoa.MaKhoa)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(khoa);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!KhoaExists(khoa.MaKhoa))
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
            ViewData["MaTruong"] = new SelectList(_context.Truongs, "MaTruong", "MaTruong", khoa.MaTruong);
            return View(khoa);
        }

        // GET: Khoas/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var khoa = await _context.Khoas
                .Include(k => k.MaTruongNavigation)
                .FirstOrDefaultAsync(m => m.MaKhoa == id);
            if (khoa == null)
            {
                return NotFound();
            }

            return View(khoa);
        }

        // POST: Khoas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var khoa = await _context.Khoas.FindAsync(id);
            if (khoa != null)
            {
                _context.Khoas.Remove(khoa);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool KhoaExists(string id)
        {
            return _context.Khoas.Any(e => e.MaKhoa == id);
        }
    }
}
