using Microsoft.AspNetCore.Mvc;
using QuanLySinhVien_CuoiKi.Models;
namespace QuanLySinhVien_CuoiKi.Controllers
{
    public class NguoiDungController : Controller
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public NguoiDungController(QuanLySinhVienCuoiKiContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public IActionResult Login(NguoiDung model)
        {
            var user = _context.NguoiDungs.FirstOrDefault(u => u.Username == model.Username && u.Password == model.Password);
            if (user != null)
            {
                // Lưu thông tin người dùng vào session
                HttpContext.Session.SetString("UserId", user.UserId.ToString());

                // Đăng nhập thành công, thực hiện các hành động sau đây
                // Ví dụ: Chuyển hướng đến trang chính sau khi đăng nhập thành công
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không chính xác.");
                return View(model);
            }
        }


    }
}
