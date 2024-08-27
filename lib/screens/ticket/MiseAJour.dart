import 'package:flutter/material.dart';
import 'header.dart'; // Assurez-vous que l'import est correct

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int? selectedTicketIndex;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  // Simulated list of tickets
  final List<Map<String, String>> tickets = [
    {'title': 'Ticket 1', 'status': 'InProgress', 'description': 'Description for Ticket 1'},
    {'title': 'Ticket 2', 'status': 'Completed', 'description': 'Description for Ticket 2'},
    {'title': 'Ticket 3', 'status': 'Pending', 'description': 'Description for Ticket 3'},
    {'title': 'Ticket 4', 'status': 'InProgress', 'description': 'Description for Ticket 4'},
    {'title': 'Ticket 5', 'status': 'Completed', 'description': 'Description for Ticket 5'},
  ];

  String? selectedStatus;
  String? selectedPriority;
  String? selectedType;

  List<String> statuses = ["Pending", "InProgress", "Completed"];
  List<String> priorities = ["High", "Medium", "Low"];
  List<String> types = ["Task", "Bug", "Story"];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          selectedStartDate = picked;
        } else {
          selectedEndDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0), // Espacement ajouté
            child: Header(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacement ajouté
              child: Row(
                children: [
                  // Ticket List
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blueGrey.shade800, Colors.grey.shade900],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Listes des tickets',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: tickets.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 4,
                                    color: Colors.blueGrey.shade700,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(16),
                                      title: Text(
                                        tickets[index]['title']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Statut: ${tickets[index]['status']}',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70),
                                      onTap: () {
                                        setState(() {
                                          selectedTicketIndex = index;
                                          // Reset form values for selected ticket
                                          selectedStatus = statuses.first;
                                          selectedPriority = priorities.first;
                                          selectedType = types.first;
                                          selectedStartDate = null;
                                          selectedEndDate = null;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Ticket Details
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF9C27B0), Colors.blueGrey.shade900],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: selectedTicketIndex != null
                            ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Détails du ${tickets[selectedTicketIndex!]['title']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Description Field
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  hintText: tickets[selectedTicketIndex!]['description'],
                                  labelStyle: TextStyle(color: Colors.white70),
                                  filled: true,
                                  fillColor: Color(0xFF9C27B0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Date de début Field with Date Picker
                              GestureDetector(
                                onTap: () => _selectDate(context, true),
                                child: AbsorbPointer(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Date de Début',
                                      hintText: selectedStartDate != null
                                          ? "${selectedStartDate!.day}/${selectedStartDate!.month}/${selectedStartDate!.year}"
                                          : 'Sélectionnez une date',
                                      labelStyle: TextStyle(color: Colors.white70),
                                      filled: true,
                                      fillColor: Color(0xFF9C27B0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      suffixIcon: Icon(Icons.calendar_today, color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Date de fin Field with Date Picker
                              GestureDetector(
                                onTap: () => _selectDate(context, false),
                                child: AbsorbPointer(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Date de Fin',
                                      hintText: selectedEndDate != null
                                          ? "${selectedEndDate!.day}/${selectedEndDate!.month}/${selectedEndDate!.year}"
                                          : 'Sélectionnez une date',
                                      labelStyle: TextStyle(color: Colors.white70),
                                      filled: true,
                                      fillColor: Color(0xFF9C27B0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      suffixIcon: Icon(Icons.calendar_today, color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Développeur assigné Field
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Développeur assigné',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  filled: true,
                                  fillColor: Color(0xFF9C27B0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Priority Dropdown
                              DropdownButtonFormField<String>(
                                value: selectedPriority,
                                items: priorities.map((String priority) {
                                  return DropdownMenuItem<String>(
                                    value: priority,
                                    child: Text(priority, style: TextStyle(color: Colors.white)),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  labelText: 'Priorité',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  filled: true,
                                  fillColor: Color(0xFF9C27B0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                dropdownColor: Color(0xFF9C27B0),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedPriority = newValue;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              // Status Dropdown
                              DropdownButtonFormField<String>(
                                value: selectedStatus,
                                items: statuses.map((String status) {
                                  return DropdownMenuItem<String>(
                                    value: status
                                    ,
                                    child: Text(status, style: TextStyle(color: Colors.white)),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  labelText: 'Statut',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  filled: true,
                                  fillColor: Color(0xFF9C27B0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                dropdownColor: Color(0xFF9C27B0),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
// Type Dropdown
                              DropdownButtonFormField<String>(
                                value: selectedType,
                                items: types.map((String type) {
                                  return DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(type, style: TextStyle(color: Colors.white)),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  labelText: 'Type',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  filled: true,
                                  fillColor: Color(0xFF9C27B0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                dropdownColor: Color(0xFF9C27B0),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                            : Center(
                          child: Text(
                            'Sélectionnez un ticket dans la liste',
                            style: TextStyle(color: Colors.white70, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

