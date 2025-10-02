#!/bin/bash
BACKUP_DIR="netbox-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup database
docker exec -t b2b4ebff4f26  pg_dump -U netbox netbox > "$BACKUP_DIR/netbox.sql"

# Backup media files
docker cp 8de92b001612:/opt/netbox/netbox/media "$BACKUP_DIR/media"

echo "Backup completed in $BACKUP_DIR"
