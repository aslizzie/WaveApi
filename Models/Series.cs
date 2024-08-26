namespace WaveApi.Models
{
    public class Serie
    {
        public int serie_id { get; set; }
        public int content_id { get; set; }
        public int seasons { get; set; }
        public int episodes { get; set; }
        public Content Content { get; set; }
    }
}
