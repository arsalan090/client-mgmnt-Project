import 'dart:io';

class Client {
  late String name;
  late String email;
  late String phoneNumber;

  Client(this.name, this.email, this.phoneNumber);
}

class ClientManagementSystem {
  List<Client> clients = [];

  void addClient() {
    print("\nEnter client details:");
    stdout.write("Name: ");
    var name = stdin.readLineSync() ?? '';

    stdout.write("Email: ");
    var email = stdin.readLineSync() ?? '';

    stdout.write("Phone Number: ");
    var phoneNumber = stdin.readLineSync() ?? '';

    var newClient = Client(name, email, phoneNumber);
    clients.add(newClient);

    print("Client added successfully!");
  }

  void displayAllClients() {
    if (clients.isEmpty) {
      print("No clients available.");
    } else {
      print("\nList of Clients:");
      for (var i = 0; i < clients.length; i++) {
        print("${i + 1}. Name: ${clients[i].name} | Email: ${clients[i].email} | Phone Number: ${clients[i].phoneNumber}");
      }
    }
  }

  void searchClientByName() {
    stdout.write("Enter client name to search: ");
    var searchName = stdin.readLineSync() ?? '';

    var searchResults = clients.where((client) => client.name.toLowerCase().contains(searchName.toLowerCase())).toList();

    if (searchResults.isEmpty) {
      print("No clients found with the name '$searchName'.");
    } else {
      print("\nSearch Results:");
      for (var i = 0; i < searchResults.length; i++) {
        print("${i + 1}. Name: ${searchResults[i].name} | Email: ${searchResults[i].email} | Phone Number: ${searchResults[i].phoneNumber}");
      }
    }
  }

  void deleteClientByName() {
    stdout.write("Enter client name to delete: ");
    var deleteName = stdin.readLineSync() ?? '';

    var deletedClients = clients.where((client) => client.name.toLowerCase() == deleteName.toLowerCase()).toList();

    if (deletedClients.isEmpty) {
      print("No clients found with the name '$deleteName'.");
    } else {
      clients.removeWhere((client) => client.name.toLowerCase() == deleteName.toLowerCase());
      print("Deleted ${deletedClients.length} client(s) with the name '$deleteName'.");
    }
  }

  void updateClientByName() {
    stdout.write("Enter client name to update: ");
    var updateName = stdin.readLineSync() ?? '';

    var clientToUpdate = clients.firstWhere((client) => client.name.toLowerCase() == updateName.toLowerCase(), orElse: () => Client("", "", ""));

    if (clientToUpdate.name.isEmpty) {
      print("No clients found with the name '$updateName'.");
    } else {
      print("\nEnter new client details for '${clientToUpdate.name}':");
      stdout.write("Name: ");
      clientToUpdate.name = stdin.readLineSync() ?? '';

      stdout.write("Email: ");
      clientToUpdate.email = stdin.readLineSync() ?? '';

      stdout.write("Phone Number: ");
      clientToUpdate.phoneNumber = stdin.readLineSync() ?? '';

      print("Client updated successfully!");
    }
  }

  void viewClientSummary() {
    print("\nClient Summary:");
    print("Total number of clients: ${clients.length}");
  }
}

void main() {
  var clientSystem = ClientManagementSystem();

  while (true) {
    print("\nClient Management System");
    print('1. Add client');
    print('2. Display all clients');
    print('3. Search client by name');
    print('4. Delete client by name');
    print('5. Update client by name');
    print('6. View client summary');
    print('7. Exit');

    stdout.write("Enter your choice: ");
    var choice = int.tryParse(stdin.readLineSync()!) ?? 0;

    switch (choice) {
      case 1:
        clientSystem.addClient();
        break;
      case 2:
        clientSystem.displayAllClients();
        break;
      case 3:
        clientSystem.searchClientByName();
        break;
      case 4:
        clientSystem.deleteClientByName();
        break;
      case 5:
        clientSystem.updateClientByName();
        break;
      case 6:
        clientSystem.viewClientSummary();
        break;
      case 7:
        exit(0);
      default:
        print("Invalid choice. Please enter a valid option.");
    }
  }
}
