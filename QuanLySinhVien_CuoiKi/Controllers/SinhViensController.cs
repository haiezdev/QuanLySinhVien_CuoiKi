using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using QuanLySinhVien_CuoiKi.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace QuanLySinhVien_CuoiKi.Controllers
{
    public class SinhViensController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public SinhViensController(QuanLySinhVienCuoiKiContext context)
        {
            _context = context;
        }

        public ActionResult TimKiem(string searchTerm)
        {
            return RedirectToAction("Index", new { searchTerm });
        }


        public async Task<IActionResult> Index(string searchTerm)
        {
            IQueryable<SinhVien> sinhViens = _context.SinhViens.Include(h => h.MaLopShNavigation);
            if (!string.IsNullOrEmpty(searchTerm))
            {

                sinhViens = sinhViens.Where(s => s.MaSv.Contains(searchTerm) ||
                                  s.TenSv.Contains(searchTerm) ||
                                  s.GioiTinh.Contains(searchTerm) ||
                                  s.NgaySinh.Value.ToString() == searchTerm ||
                                  s.Email.Contains(searchTerm) ||
                                  s.SoDienThoai.Contains(searchTerm) ||
                                  s.DiaChi.Contains(searchTerm) ||
                                  s.MaLopSh.Contains(searchTerm));


                int count = await sinhViens.CountAsync();
                ViewBag.Count = count;
                ViewBag.SearchTerm = searchTerm;
            }
            return View(sinhViens);
        }

        //// GET: SinhViens
        //public async Task<IActionResult> Index()
        //{
        //    var quanLySinhVienCuoiKiContext = _context.SinhViens.Include(s => s.MaLopShNavigation);
        //    return View(await quanLySinhVienCuoiKiContext.ToListAsync());
        //}

        // GET: SinhViens/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sinhVien = await _context.SinhViens
                .Include(s => s.MaLopShNavigation)
                .FirstOrDefaultAsync(m => m.MaSv == id);
            if (sinhVien == null)
            {
                return NotFound();
            }

            return View(sinhVien);
        }

        // GET: SinhViens/Create
        public IActionResult Create()
        {
            ViewBag.MaLopSh = new SelectList(_context.LopSinhHoats, "MaLopSh", "MaLopSh");
            return View();
        }

        // POST: SinhViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaSv,TenSv,NgaySinh,GioiTinh,Email,SoDienThoai,DiaChi,MaLopSh")] SinhVien sinhVien)
        {
            foreach (var entry in ModelState)
            {
                Console.WriteLine($"Property: {entry.Key}");
                var value = entry.Value.AttemptedValue;
                Console.WriteLine($"Value: {value}");
            }
            foreach (var modelState in ModelState.Values)
            {
                foreach (var error in modelState.Errors)
                {
                    Console.WriteLine(error.ErrorMessage);
                }
            }
            if (ModelState.IsValid)
            {
                _context.Add(sinhVien);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.MaLopSh = new SelectList(_context.LopSinhHoats, "MaLopSh", "MaLopSh", sinhVien.MaLopSh);
            return View(sinhVien);
        }

        // GET: SinhViens/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sinhVien = await _context.SinhViens.FindAsync(id);
            if (sinhVien == null)
            {
                return NotFound();
            }
            ViewData["MaLopSh"] = new SelectList(_context.LopSinhHoats, "MaLopSh", "MaLopSh", sinhVien.MaLopSh);
            return View(sinhVien);
        }

        // POST: SinhViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaSv,TenSv,NgaySinh,GioiTinh,Email,SoDienThoai,DiaChi,MaLopSh")] SinhVien sinhVien)
        {
            if (id != sinhVien.MaSv)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(sinhVien);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SinhVienExists(sinhVien.MaSv))
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
            ViewData["MaLopSh"] = new SelectList(_context.LopSinhHoats, "MaLopSh", "MaLopSh", sinhVien.MaLopSh);
            return View(sinhVien);
        }

        // GET: SinhViens/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sinhVien = await _context.SinhViens
                .Include(s => s.MaLopShNavigation)
                .FirstOrDefaultAsync(m => m.MaSv == id);
            if (sinhVien == null)
            {
                return NotFound();
            }

            return View(sinhVien);
        }

        // POST: SinhViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var sinhVien = await _context.SinhViens.FindAsync(id);
            if (sinhVien != null)
            {
                _context.SinhViens.Remove(sinhVien);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SinhVienExists(string id)
        {
            return _context.SinhViens.Any(e => e.MaSv == id);
        }
    }
}
