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

        public ActionResult TimKiem(string searchTerm)
        {
            return RedirectToAction("Index", new { searchTerm });
        }

        public async Task<IActionResult> Index(string searchTerm)
        {
            IQueryable<LopHocPhan> lopHocPhans = _context.LopHocPhans
                .Include(l => l.MaHocPhanNavigation)
                .Include(l => l.MaSvNavigation);

            if (!string.IsNullOrEmpty(searchTerm))
            {
                lopHocPhans = lopHocPhans.Where(l => l.Diem.ToString().Contains(searchTerm) ||
                                                     l.MaHocPhan.Contains(searchTerm) ||
                                                     l.MaSv.Contains(searchTerm));

                int count = await lopHocPhans.CountAsync();
                ViewBag.Count = count;
                ViewBag.SearchTerm = searchTerm;
            }

            // Trả về kết quả tìm kiếm hoặc toàn bộ dữ liệu
            return View(await lopHocPhans.ToListAsync());
        }




        //// GET: LopHocPhans
        //public async Task<IActionResult> Index()
        //{
        //    var quanLySinhVienCuoiKiContext = _context.LopHocPhans.Include(l => l.MaHocPhanNavigation).Include(l => l.MaSvNavigation);
        //    return View(await quanLySinhVienCuoiKiContext.ToListAsync());
        //}

        // GET: LopHocPhans/Details?maSv=1&maHocPhan=2
        public async Task<IActionResult> Details(string maSv, string maHocPhan)
        {
            if (maSv == null || maHocPhan == null)
            {
                return NotFound();
            }

            var lopHocPhan = await _context.LopHocPhans
                .Include(l => l.MaHocPhanNavigation)
                .Include(l => l.MaSvNavigation)
                .FirstOrDefaultAsync(m => m.MaSv == maSv && m.MaHocPhan == maHocPhan);
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaSv,MaHocPhan,Diem")] LopHocPhan lopHocPhan)
        {
            foreach (var modelState in ModelState.Values)
            {
                foreach (var error in modelState.Errors)
                {
                    Console.WriteLine(error.ErrorMessage);
                }
            }

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


        // GET: LopHocPhans/Edit?maSv=1&maHocPhan=2
        public async Task<IActionResult> Edit(string maSv, string maHocPhan)
        {
            if (maSv == null || maHocPhan == null)
            {
                return NotFound();
            }

            var lopHocPhan = await _context.LopHocPhans.FindAsync(maSv, maHocPhan);
            if (lopHocPhan == null)
            {
                return NotFound();
            }
            ViewData["MaHocPhan"] = new SelectList(_context.HocPhans, "MaHocPhan", "MaHocPhan", lopHocPhan.MaHocPhan);
            ViewData["MaSv"] = new SelectList(_context.SinhViens, "MaSv", "MaSv", lopHocPhan.MaSv);
            return View(lopHocPhan);
        }

        // POST: LopHocPhans/Edit?maSv=1&maHocPhan=2
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string maSv, string maHocPhan, [Bind("MaSv,MaHocPhan,Diem")] LopHocPhan lopHocPhan)
        {
            if (maSv != lopHocPhan.MaSv || maHocPhan != lopHocPhan.MaHocPhan)
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
                    if (!LopHocPhanExists(lopHocPhan.MaSv, lopHocPhan.MaHocPhan))
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

        // GET: LopHocPhans/Delete?maSv=1&maHocPhan=2
        public async Task<IActionResult> Delete(string maSv, string maHocPhan)
        {
            if (maSv == null || maHocPhan == null)
            {
                return NotFound();
            }

            var lopHocPhan = await _context.LopHocPhans
                .Include(l => l.MaHocPhanNavigation)
                .Include(l => l.MaSvNavigation)
                .FirstOrDefaultAsync(m => m.MaSv == maSv && m.MaHocPhan == maHocPhan);
            if (lopHocPhan == null)
            {
                return NotFound();
            }

            return View(lopHocPhan);
        }

        // POST: LopHocPhans/Delete?maSv=1&maHocPhan=2
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string maSv, string maHocPhan)
        {
            var lopHocPhan = await _context.LopHocPhans.FindAsync(maSv, maHocPhan);
            if (lopHocPhan != null)
            {
                _context.LopHocPhans.Remove(lopHocPhan);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool LopHocPhanExists(string maSv, string maHocPhan)
        {
            return _context.LopHocPhans.Any(e => e.MaSv == maSv && e.MaHocPhan == maHocPhan);
        }
    }
}
