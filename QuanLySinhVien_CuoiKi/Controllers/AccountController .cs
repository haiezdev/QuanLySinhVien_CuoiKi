using Microsoft.AspNetCore.Mvc;

namespace QuanLySinhVien_CuoiKi.Controllers
{
    public class AccountController : Controller
    {
        private readonly YourDbContext _context;

        public AccountController(YourDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(LoginViewModel model)
        {
            var user = _context.Users.FirstOrDefault(u => u.Username == model.Username && u.Password == model.Password);
            if (user != null)
            {
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
