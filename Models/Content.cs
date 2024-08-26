namespace WaveApi.Models
{
    public class Content
    {
        public int content_id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string banner_image { get; set; }
        public string hero_image { get; set; }
        public string genre { get; set; }
        public DateTime release_date { get; set; }

        public Movie? Movie { get; set; }

        public Serie? Serie { get; set; }

        public ICollection<Favorite> Favorites { get; set; }
    }
}