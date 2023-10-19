from public.models import DemoProvince, DemoUser
from django.contrib import admin


@admin.register(DemoProvince)
class TagAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'code')


@admin.register(DemoUser)
class NoteAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'sex', 'birthday', 'height', 'weight', 'created_time')
    search_fields = ('username',)
