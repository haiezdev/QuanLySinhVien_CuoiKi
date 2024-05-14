using System;
using System.Collections.Generic;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class Truong
{
    public string MaTruong { get; set; } = null!;

    public string? TenTruong { get; set; }

    public string? DiaChi { get; set; }

    public virtual ICollection<Khoa> Khoas { get; set; } = new List<Khoa>();
}
