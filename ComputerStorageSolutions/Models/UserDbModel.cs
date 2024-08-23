﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace ComputerStorageSolutions.Models
{
    public class UserDbModel
    {
        [Key]
        /*[DatabaseGenerated(DatabaseGeneratedOption.Identity)]*/
        public Guid UserId { get; set; }

        [Required]
        [StringLength(100)]
        public string Username { get; set; } = string.Empty;

        [Required]
        [StringLength(255)]
        public string PasswordHash { get; set; } = string.Empty;

        [Required]
        [StringLength(255)]
        public string Email { get; set; } = string.Empty;

        [ForeignKey(nameof(Role))]
        public Guid RoleId { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required]
        public bool IsActive { get; set; }

        [JsonIgnore]
        public virtual RoleDbModel? Role { get; set; }
        /*public virtual ICollection<OrdersDbModel> Orders { get; set; } = new List<OrdersDbModel>();*/
    }

}
