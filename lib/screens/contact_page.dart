import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Contact Support"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Get in Touch",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Have questions or feedback? We'd love to hear from you.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            /// Row containing both cards
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Message Form Card
                Expanded(
                  child: _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Send us a Message",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _textField("Your Name"),
                        const SizedBox(height: 10),
                        _textField("Email Address"),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: _inputDecoration("Subject"),
                          items: const [
                            DropdownMenuItem(
                              value: "Order",
                              child: Text("Order"),
                            ),
                            DropdownMenuItem(
                              value: "Payment",
                              child: Text("Payment"),
                            ),
                            DropdownMenuItem(
                              value: "Complaint",
                              child: Text("Complaint"),
                            ),
                            DropdownMenuItem(
                              value: "Other",
                              child: Text("Other"),
                            ),
                          ],
                          onChanged: (v) {},
                        ),
                        const SizedBox(height: 10),
                        _textField("Message", maxLines: 4),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Message sent")),
                              );
                            },
                            child: const Text("Send Message"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16), // spacing between cards
                /// Contact Info + FAQ Card
                Expanded(
                  child: _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Contact Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        _InfoRow(Icons.phone, "+1 (555) 123-4567"),
                        _InfoRow(Icons.email, "support@foodhub.com"),
                        _InfoRow(
                          Icons.location_on,
                          "123 Food Street, San Francisco, CA 94102",
                        ),
                        _InfoRow(
                          Icons.access_time,
                          "Mon-Fri: 8am – 10pm\nSat-Sun: 9am – 11pm",
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Frequently Asked Questions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "• How long does delivery take?\n  Most orders arrive within 30-45 minutes",
                        ),
                        Text(
                          "• What's the minimum order?\n  No minimum order required. Delivery is free over \$30",
                        ),
                        Text(
                          "• Can I track my order?\n  Yes! You'll receive real-time updates via email",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Card Container
  static Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: child,
    );
  }

  /// TextField
  static Widget _textField(String hint, {int maxLines = 1}) {
    return TextField(maxLines: maxLines, decoration: _inputDecoration(hint));
  }

  static InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

/// Info Row
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepOrange, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
