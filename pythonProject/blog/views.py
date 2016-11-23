from django.shortcuts import render
from django.utils import timezone
from .models import Post

# Create your views here.
def PostList(request):
    posts = Post.objects.filter(publishedDate__lte = timezone.now()).order_by('publishedDate')
    print posts
    return render(request, 'blog/PostList.html', {'posts' : posts})