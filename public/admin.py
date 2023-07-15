from public.models import DemoKind, DemoUser
from django.contrib import admin


@admin.register(DemoKind)
class TagAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')


@admin.register(DemoUser)
class NoteAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'kind', 'sex', 'birthday', 'height', 'weight', 'created_time')
    search_fields = ('username',)
