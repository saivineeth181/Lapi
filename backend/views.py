from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import inventory,Patrons,List
from .serializers import inventorySerializer,PatronsSerializer,ListSerializer
import requests


@api_view(['GET'])
def Inventory_view(request):
    task = inventory.objects.all()
    serializer = inventorySerializer(task,many=True)
    
    return Response(serializer.data)

@api_view(['POST'])
def Inventory_cam(request):
    book_isbn = request.data['isbn']
    quantity = request.data['quantity']
    url = 'https://www.googleapis.com/books/v1/volumes?q=isbn+' + book_isbn
    res = requests.get(url)
    res = res.json()

    i=0
    while(i!=len(res["items"])):
        try:
            title = res["items"][i]['volumeInfo']['title']
            book_cover_pic = res["items"][i]['volumeInfo']["imageLinks"]["smallThumbnail"]
            break
        except:
            i += 1
    data_json = {
        "title":title,
        "book_over_pic":book_cover_pic,
        "quantity":quantity,
    }
    serializer = inventorySerializer(data=data_json)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)

@api_view(["POST"])
def Inventory_create(request):
    serializer = inventorySerializer(data=request.data)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)

@api_view(["PUT"])
def Inventory_update(request,pk):
    task = inventory.objects.get(id=pk)
    serializer = inventorySerializer(instance=task, data=request.data)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)
    
@api_view(["DELETE"])
def Inventory_delete(request,pk):
    task = inventory.objects.get(id=pk)
    task.delete()
    
    return Response('deleted!')
    
@api_view(['GET'])
def Patrons_view(request):
    task = Patrons.objects.all()
    serializer = PatronsSerializer(task,many=True)
    
    return Response(serializer.data)

@api_view(["POST"])
def Patrons_create(request):
    serializer = PatronsSerializer(data=request.data)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)

@api_view(["PUT"])
def Patrons_update(request,pk):
    task = Patrons.objects.get(id=pk)
    serializer = PatronsSerializer(instance=task, data=request.data)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)
    
@api_view(["DELETE"])
def Patrons_delete(request,pk):
    task = Patrons.objects.get(id=pk)
    task.delete()
    
    return Response('deleted!')

@api_view(['GET'])
def List_view(request,username):
    
    User = Patrons.objects.get(name=username)
    task = List.objects.filter(name=int(User.id))
    serializer = ListSerializer(task,many=True)
    
    return Response(serializer.data)

@api_view(["POST"])
def List_create(request):
    
    serializer = ListSerializer(data=request.data)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)

@api_view(["PUT"])
def List_update(request,pk):
    task = List.objects.get(id=pk)
    serializer = ListSerializer(instance=task, data=request.data)
    if(serializer.is_valid()):
        serializer.save()
    
    return Response(serializer.data)
    
@api_view(["DELETE"])
def List_delete(request,pk):
    task = List.objects.get(id=pk)
    task.delete()
    
    return Response('deleted!')