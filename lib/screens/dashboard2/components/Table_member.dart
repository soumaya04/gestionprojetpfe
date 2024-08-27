import 'package:flutter/material.dart';
import '../../../constants.dart';
class Member {
  final String email;
  final int totalTickets;
  final int ticketsDone;
  final int ticketsNotDone;

  Member({
    required this.email,
    required this.totalTickets,
    required this.ticketsDone,
    required this.ticketsNotDone,
  });
}

List<Member> demoMembers = [
  Member(
    email: "alice.johnson@example.com",
    totalTickets: 10,
    ticketsDone: 7,
    ticketsNotDone: 3,
  ),
  Member(
    email: "bob.smith@example.com",
    totalTickets: 15,
    ticketsDone: 10,
    ticketsNotDone: 5,
  ),
  // Add more members as needed
];

class TableMember extends StatelessWidget {
  const TableMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Team Members",
            style: Theme.of(context).textTheme.titleMedium, // Use headline5 instead of headline6
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 16.0,
              columns: [
                DataColumn(
                  label: Text("Email"),
                ),
                DataColumn(
                  label: Text("Total Tickets"),
                ),
                DataColumn(
                  label: Text("Tickets Done"),
                ),
                DataColumn(
                  label: Text("Tickets Not Done"),
                ),
              ],
              rows: List.generate(
                demoMembers.length,
                    (index) => memberDataRow(demoMembers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow memberDataRow(Member member) {
    return DataRow(
      cells: [
        DataCell(Text(member.email)),
        DataCell(Text(member.totalTickets.toString())),
        DataCell(Text(member.ticketsDone.toString())),
        DataCell(Text(member.ticketsNotDone.toString())),
      ],
    );
  }
}
