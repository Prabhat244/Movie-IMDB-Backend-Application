using System;
using System.ComponentModel.DataAnnotations;


namespace MoviesAPI.Data.Models
{
    public class Producer
    {
        [Key]
        public int producer_id { get; set; }
        public string producer_name { get; set; }
        public string company_name { get; set; }
        public DateTime date_of_birth { get; set; }
        public string gender { get; set; }
    }
}