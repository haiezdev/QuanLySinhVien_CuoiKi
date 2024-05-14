using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class QuanLySinhVienCuoiKiContext : DbContext
{
    public QuanLySinhVienCuoiKiContext()
    {
    }

    public QuanLySinhVienCuoiKiContext(DbContextOptions<QuanLySinhVienCuoiKiContext> options)
        : base(options)
    {
    }

    public virtual DbSet<GiaoVien> GiaoViens { get; set; }

    public virtual DbSet<HocPhan> HocPhans { get; set; }

    public virtual DbSet<Khoa> Khoas { get; set; }

    public virtual DbSet<LopHocPhan> LopHocPhans { get; set; }

    public virtual DbSet<LopSinhHoat> LopSinhHoats { get; set; }

    public virtual DbSet<SinhVien> SinhViens { get; set; }

    public virtual DbSet<Truong> Truongs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=HAIHOINACH\\SQLEXPRESS;Initial Catalog=QuanLySinhVien_CuoiKi;User ID=sa;Password=sa;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<GiaoVien>(entity =>
        {
            entity.HasKey(e => e.MaGv).HasName("PK__giao_vie__0FE116133F611056");

            entity.ToTable("giao_vien");

            entity.Property(e => e.MaGv)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_gv");
            entity.Property(e => e.BoMon)
                .HasMaxLength(100)
                .HasColumnName("bo_mon");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.MaKhoa)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_khoa");
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("so_dien_thoai");
            entity.Property(e => e.TenGv)
                .HasMaxLength(50)
                .HasColumnName("ten_gv");

            entity.HasOne(d => d.MaKhoaNavigation).WithMany(p => p.GiaoViens)
                .HasForeignKey(d => d.MaKhoa)
                .HasConstraintName("FK__giao_vien__ma_kh__2E1BDC42");
        });

        modelBuilder.Entity<HocPhan>(entity =>
        {
            entity.HasKey(e => e.MaHocPhan).HasName("PK__hoc_phan__0B830B71FA057FB3");

            entity.ToTable("hoc_phan");

            entity.Property(e => e.MaHocPhan)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_hoc_phan");
            entity.Property(e => e.MaGv)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_gv");
            entity.Property(e => e.MaKhoa)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_khoa");
            entity.Property(e => e.SoTinChi).HasColumnName("so_tin_chi");
            entity.Property(e => e.TenHocPhan)
                .HasMaxLength(100)
                .HasColumnName("ten_hoc_phan");

            entity.HasOne(d => d.MaGvNavigation).WithMany(p => p.HocPhans)
                .HasForeignKey(d => d.MaGv)
                .HasConstraintName("FK__hoc_phan__ma_gv__30F848ED");

            entity.HasOne(d => d.MaKhoaNavigation).WithMany(p => p.HocPhans)
                .HasForeignKey(d => d.MaKhoa)
                .HasConstraintName("FK__hoc_phan__ma_kho__31EC6D26");
        });

        modelBuilder.Entity<Khoa>(entity =>
        {
            entity.HasKey(e => e.MaKhoa).HasName("PK__khoa__B2C5324EE9EC2D5A");

            entity.ToTable("khoa");

            entity.Property(e => e.MaKhoa)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_khoa");
            entity.Property(e => e.MaTruong)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_truong");
            entity.Property(e => e.TenKhoa)
                .HasMaxLength(100)
                .HasColumnName("ten_khoa");

            entity.HasOne(d => d.MaTruongNavigation).WithMany(p => p.Khoas)
                .HasForeignKey(d => d.MaTruong)
                .HasConstraintName("FK__khoa__ma_truong__267ABA7A");
        });

        modelBuilder.Entity<LopHocPhan>(entity =>
        {
            entity.HasKey(e => new { e.MaSv, e.MaHocPhan }).HasName("PK__lop_hoc___0F58C435E559BDFA");

            entity.ToTable("lop_hoc_phan");

            entity.Property(e => e.MaSv)
                .HasMaxLength(14)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_sv");
            entity.Property(e => e.MaHocPhan)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_hoc_phan");
            entity.Property(e => e.Diem).HasColumnName("diem");

            entity.HasOne(d => d.MaHocPhanNavigation).WithMany(p => p.LopHocPhans)
                .HasForeignKey(d => d.MaHocPhan)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__lop_hoc_p__ma_ho__398D8EEE");

            entity.HasOne(d => d.MaSvNavigation).WithMany(p => p.LopHocPhans)
                .HasForeignKey(d => d.MaSv)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__lop_hoc_p__ma_sv__38996AB5");
        });

        modelBuilder.Entity<LopSinhHoat>(entity =>
        {
            entity.HasKey(e => e.MaLopSh).HasName("PK__lopSinhH__47376D386D3AFB01");

            entity.ToTable("lopSinhHoat");

            entity.Property(e => e.MaLopSh)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_lopSH");
            entity.Property(e => e.MaKhoa)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_khoa");
            entity.Property(e => e.TenLopSh)
                .HasMaxLength(100)
                .HasColumnName("ten_lopSH");

            entity.HasOne(d => d.MaKhoaNavigation).WithMany(p => p.LopSinhHoats)
                .HasForeignKey(d => d.MaKhoa)
                .HasConstraintName("FK__lopSinhHo__ma_kh__29572725");
        });

        modelBuilder.Entity<SinhVien>(entity =>
        {
            entity.HasKey(e => e.MaSv).HasName("PK__sinh_vie__0FE0F4820B0B962C");

            entity.ToTable("sinh_vien");

            entity.Property(e => e.MaSv)
                .HasMaxLength(14)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_sv");
            entity.Property(e => e.DiaChi)
                .HasMaxLength(255)
                .HasColumnName("dia_chi");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.GioiTinh)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("gioi_tinh");
            entity.Property(e => e.MaLopSh)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_lopSH");
            entity.Property(e => e.NgaySinh).HasColumnName("ngay_sinh");
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("so_dien_thoai");
            entity.Property(e => e.TenSv)
                .HasMaxLength(50)
                .HasColumnName("ten_sv");

            entity.HasOne(d => d.MaLopShNavigation).WithMany(p => p.SinhViens)
                .HasForeignKey(d => d.MaLopSh)
                .HasConstraintName("FK__sinh_vien__ma_lo__35BCFE0A");
        });

        modelBuilder.Entity<Truong>(entity =>
        {
            entity.HasKey(e => e.MaTruong).HasName("PK__truong__5BFE697F4080ACF9");

            entity.ToTable("truong");

            entity.Property(e => e.MaTruong)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ma_truong");
            entity.Property(e => e.DiaChi)
                .HasMaxLength(255)
                .HasColumnName("dia_chi");
            entity.Property(e => e.TenTruong)
                .HasMaxLength(100)
                .HasColumnName("ten_truong");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
