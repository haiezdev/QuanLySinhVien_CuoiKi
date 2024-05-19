using System.ComponentModel.DataAnnotations;

namespace QuanLySinhVien_CuoiKi.Models
{
    public class NguoiDung
    {
        [Key]
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}