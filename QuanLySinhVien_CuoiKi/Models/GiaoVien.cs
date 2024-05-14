using System;
using System.Collections.Generic;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class GiaoVien
{
    public string MaGv { get; set; } = null!;

    public string TenGv { get; set; } = null!;

    public string? Email { get; set; }

    public string? SoDienThoai { get; set; }

    public string? BoMon { get; set; }

    public string? MaKhoa { get; set; }

    public virtual ICollection<HocPhan> HocPhans { get; set; } = new List<HocPhan>();

    public virtual Khoa? MaKhoaNavigation { get; set; }
}
