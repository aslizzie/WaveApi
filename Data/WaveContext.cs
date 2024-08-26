using Microsoft.EntityFrameworkCore;
using WaveApi.Models;

public class WaveContext : DbContext
{
    public DbSet<User> Users { get; set; }
    public DbSet<Content> Contents { get; set; }
    public DbSet<Movie> Movies { get; set; }
    public DbSet<Serie> Series { get; set; }

    public DbSet<Favorite> Favorites { get; set; }

    public WaveContext(DbContextOptions<WaveContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Favorite>()
            .HasKey(f => new { f.user_id, f.content_id });

        modelBuilder.Entity<Content>()
            .ToTable("Content");

        modelBuilder.Entity<User>()
            .HasKey(u => u.user_id);

        modelBuilder.Entity<Content>()
            .HasKey(c => c.content_id);

        modelBuilder.Entity<Movie>()
            .HasKey(m => m.movie_id);

        modelBuilder.Entity<Serie>()
            .HasKey(s => s.serie_id);

        modelBuilder.Entity<Content>()
            .HasOne(c => c.Movie)
            .WithOne(m => m.Content)
            .HasForeignKey<Movie>(m => m.content_id);

        modelBuilder.Entity<Content>()
            .HasOne(c => c.Serie)
            .WithOne(s => s.Content)
            .HasForeignKey<Serie>(s => s.content_id);
    }
}
