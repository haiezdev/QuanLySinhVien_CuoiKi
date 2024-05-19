using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace QuanLySinhVien_CuoiKi.Models
{
    public partial class SinhVien
    {
        public SinhVien()
        {
            LopHocPhans = new HashSet<LopHocPhan>();
        }
        [Key]
        [Required(ErrorMessage = "Mã sinh viên là bắt buộc")]
        //[StringLength(14, MinimumLength = 14, ErrorMessage = "Mã sinh viên phải có đúng 14 ký tự")]
        [RegularExpression(@"^(2111)\d{10}$", ErrorMessage = "Mã sinh viên phải bắt đầu bằng 2111 và có 14 ký tự")]
        [UniqueMaSv(ErrorMessage = "Mã sinh viên đã tồn tại.")]
        public string MaSv { get; set; }

        [Required(ErrorMessage = "Tên sinh viên là bắt buộc")]
        [StringLength(50, MinimumLength = 10, ErrorMessage = "Tên sinh viên phải từ 10 đến 50 ký tự")]
        public string TenSv { get; set; }

        [Required(ErrorMessage = "Ngày sinh là bắt buộc")]
        [CustomDateFormat(ErrorMessage = "Ngày sinh phải theo định dạng dd/MM/yyyy")]
        public DateOnly? NgaySinh { get; set; }

        [Required(ErrorMessage = "Giới tính là bắt buộc")]
        [RegularExpression(@"^(Nam|Nữ)$", ErrorMessage = "Giới tính chỉ có thể là Nam hoặc Nữ")]
        public string? GioiTinh { get; set; }

        [Required(ErrorMessage = "Email là bắt buộc")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "Số điện thoại là bắt buộc")]
        [RegularExpression(@"^(090|098|091|031|035|038)\d{7}$", ErrorMessage = "Số điện thoại phải bắt đầu bằng 090, 098, 091, 031, 035 hoặc 038 và có 10 ký tự")]
        public string? SoDienThoai { get; set; }

        [Required(ErrorMessage = "Địa chỉ là bắt buộc")]
        public string? DiaChi { get; set; }

        public string? MaLopSh { get; set; }

        public virtual LopSinhHoat? MaLopShNavigation { get; set; }
        public virtual ICollection<LopHocPhan>? LopHocPhans { get; set; }
    }

    // Custom validation attribute for date format
    public class CustomDateFormatAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value == null)
                return true;

            DateTime date;
            return DateTime.TryParseExact(Convert.ToString(value), "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date);
        }
    }
    public class UniqueMaSvAttribute : ValidationAttribute
    {
        private readonly QuanLySinhVienCuoiKiContext _context;

        public UniqueMaSvAttribute()
        {
            // Đối tượng context sẽ được cung cấp từ Dependency Injection
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            // Lấy đối tượng context từ ValidationContext
            var context = (QuanLySinhVienCuoiKiContext)validationContext.GetService(typeof(QuanLySinhVienCuoiKiContext));

            if (value != null)
            {
                var maSv = (string)value;
                var existingSinhVien = context.SinhViens.FirstOrDefault(s => s.MaSv == maSv);
                if (existingSinhVien != null)
                {
                    var errorMessage = $"Mã sinh viên '{maSv}' đã tồn tại.";
                    return new ValidationResult(errorMessage);
                }
            }
            return ValidationResult.Success;
        }
    }
}
