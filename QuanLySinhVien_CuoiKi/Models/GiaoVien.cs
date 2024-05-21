using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class GiaoVien
{
    [Key]
    [Required(ErrorMessage = "Mã giáo viên là bắt buộc")] 
    public string MaGv { get; set; } = null!;

    [Required(ErrorMessage = "Tên giáo viên là bắt buộc")]
    [StringLength(50, MinimumLength = 10, ErrorMessage = "Tên giáo viên phải từ 10 đến 50 ký tự")]
    public string TenGv { get; set; } = null!;

    [Required(ErrorMessage = "Email là bắt buộc")]
    [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ")]
    public string? Email { get; set; }

    [Required(ErrorMessage = "Số điện thoại là bắt buộc")]
    [RegularExpression(@"^(090|098|091|031|035|038)\d{7}$", ErrorMessage = "Số điện thoại phải bắt đầu bằng 090, 098, 091, 031, 035 hoặc 038 và có 10 ký tự")]
    public string? SoDienThoai { get; set; }

    [Required(ErrorMessage = "Bộ môn là bắt buộc")]
    public string? BoMon { get; set; }

    [Required(ErrorMessage = "Mã khoa là bắt buộc")]
    public string? MaKhoa { get; set; }

    public virtual ICollection<HocPhan> HocPhans { get; set; } = new List<HocPhan>();

    public virtual Khoa? MaKhoaNavigation { get; set; }


}
