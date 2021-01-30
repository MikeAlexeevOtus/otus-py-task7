from django.db import models


class Question(models.Model):
    title = models.CharField(max_length=256)
    content = models.CharField(max_length=1024)

    def __str__(self):
        return self.title

    # pub_date = models.DateTimeField()

    # author
    # tags
    # answers
    # rating
