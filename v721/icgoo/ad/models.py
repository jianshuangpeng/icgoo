from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import iri_to_uri, python_2_unicode_compatible
from DjangoUeditor.models import UEditorField
# Create your models here.
class Ad(models.Model):
    url = models.CharField(_('URL'),help_text=_("www.icgoo.net/ad/URL"), max_length=100, db_index=True)
    title = models.CharField(_('title'), max_length=200)
    content = UEditorField(_('content'), height=300,width=1000,default=u'',blank=True,imagePath="uploads/images/",
                toolbars='besttome',filePath='uploads/files/')
    def __unicode__(self):
        return self.title
