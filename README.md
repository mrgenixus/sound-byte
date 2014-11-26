## sound-byte

This is a Work-in-Progress app for publishing a podcast from S3.  It was originally started because [@johnsheehan](http://twitter.com/johnsheehan) said he need something like this.  I think he has probably found something better since.

### Status
Defunct. Work on this project is not currently ongoing.  The original plan was to use Heroku for deployment and S3 for files, but I am still unsure of whether I would be able to deploy (required) FFMpeg to Heroku in order to read length and content metadara from uploads.

Currently to be done:
- [ ] Implement large file uploads with CarrierWave/CarrierWave Direct
- [ ] Implement per-user s3 configuration
- [ ] Implement file-data reading with FFMpeg or other online encoding tool
- [ ] Heroku deployment
- [ ] Convert or add option for sound-cloud (optional)
