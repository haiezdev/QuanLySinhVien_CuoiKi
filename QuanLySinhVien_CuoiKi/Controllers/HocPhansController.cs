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
    public class HocPhansController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public HocPhansController(QuanLySinhVienCuoiKiContext context)
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
            IQueryable<HocPhan> hocPhans = _context.HocPhans.Include(h => h.MaKhoaNavigation);
            if (!string.IsNullOrEmpty(searchTerm))
            {

                hocPhans = hocPhans.Where(s => s.MaHocPhan.Contains(searchTerm) || s.TenHocPhan.Contains(searchTerm) ||
                                            s.SoTinChi.ToString().Contains(searchTerm) ||
                                            s.MaGv.Contains(searchTerm) || s.MaKhoa.Contains(searchTerm) ||
                                            s.MaKhoa.Contains(searchTerm));
                int count = await hocPhans.CountAsync();
                ViewBag.Count = count;
                ViewBag.SearchTerm = searchTerm;
            }
            return View(hocPhans);
        }

        //public async Task<IActionResult> Index()
        //{
        //    var quanLySinhVienCuoiKiContext = _context.HocPhans.Include(h => h.MaGvNavigation).Include(h => h.MaKhoaNavigation);
        //    return View(await quanLySinhVienCuoiKiContext.ToListAsync());
        //}

        // GET: HocPhans/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hocPhan = await _context.HocPhans
                .Include(h => h.MaGvNavigation)
                .Include(h => h.MaKhoaNavigation)
                .FirstOrDefaultAsync(m => m.MaHocPhan == id);
            if (hocPhan == null)
            {
                return NotFound();
            }

            return View(hocPhan);
        }


        // GET: HocPhans/Create
        public IActionResult Create()
        {
            ViewData["MaGv"] = new SelectList(_context.GiaoViens, "MaGv", "MaGv");
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa");
            return View();
        }

        // POST: HocPhans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaHocPhan,TenHocPhan,SoTinChi,MaGv,MaKhoa")] HocPhan hocPhan)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hocPhan);
                
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaGv"] = new SelectList(_context.GiaoViens, "MaGv", "MaGv", hocPhan.MaGv);
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", hocPhan.MaKhoa);
            return View(hocPhan);
        }

        // GET: HocPhans/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hocPhan = await _context.HocPhans.FindAsync(id);
            if (hocPhan == null)
            {
                return NotFound();
            }
            ViewData["MaGv"] = new SelectList(_context.GiaoViens, "MaGv", "MaGv", hocPhan.MaGv);
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", hocPhan.MaKhoa);
            return View(hocPhan);
        }

        // POST: HocPhans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaHocPhan,TenHocPhan,SoTinChi,MaGv,MaKhoa")] HocPhan hocPhan)
        {
            if (id != hocPhan.MaHocPhan)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hocPhan);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HocPhanExists(hocPhan.MaHocPhan))
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
            ViewData["MaGv"] = new SelectList(_context.GiaoViens, "MaGv", "MaGv", hocPhan.MaGv);
            ViewData["MaKhoa"] = new SelectList(_context.Khoas, "MaKhoa", "MaKhoa", hocPhan.MaKhoa);
            return View(hocPhan);
        }

        // GET: HocPhans/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hocPhan = await _context.HocPhans
                .Include(h => h.MaGvNavigation)
                .Include(h => h.MaKhoaNavigation)
                .FirstOrDefaultAsync(m => m.MaHocPhan == id);
            if (hocPhan == null)
            {
                return NotFound();
            }

            return View(hocPhan);
        }

        // POST: HocPhans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var hocPhan = await _context.HocPhans.FindAsync(id);
            if (hocPhan != null)
            {
                _context.HocPhans.Remove(hocPhan);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HocPhanExists(string id)
        {
            return _context.HocPhans.Any(e => e.MaHocPhan == id);
        }
    }
}
