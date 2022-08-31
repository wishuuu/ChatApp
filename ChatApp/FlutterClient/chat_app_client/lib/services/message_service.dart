import '../models/message.dart';
import 'observer.dart';

class MessageService
{
    static final MessageService _instance = MessageService._internal();

    factory MessageService() => _instance;

    MessageService._internal();

    List<Message> messages = [];
    List<Observer> observers = []; 

    addMessage(Message)
    {
      messages.add(Message);
      notifyObservers();
    }

    addObserver(Observer observer)
    {
      observers.remove((element) => element.runtimeType == observer.runtimeType);
      if(!observers.contains(observer))
      {
        observers.add(observer);
      }
    }

    notifyObservers()
    {
      for (var observer in observers)
      {
        observer.update();
      }
    }
}