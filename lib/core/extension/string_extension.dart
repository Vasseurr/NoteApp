extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension TextFormatter on String {
  String removePlateNoWhiteSpaces() =>
      this.replaceAll(' ', '').toUpperCase().toString();

  String addPlateNoWhiteSpaces() {
    var buffer = new StringBuffer();

    String isInteger(String input) {
      try {
        int.parse(input);
        return 'int';
      } catch (e) {
        return 'str';
      }
    }

    for (int i = 0; i < this.length; i++) {
      if (i == 1) {
        buffer.write(this[i]);
        buffer.write(' ');
      } else if (isInteger(this[i]) == 'str') {
        if (isInteger(this[i + 1]) != null && isInteger(this[i + 1]) == 'int') {
          buffer.write(this[i]);
          buffer.write(' ');
        } else {
          buffer.write(this[i]);
        }
      } else {
        buffer.write(this[i]);
      }
    }

    return buffer.toString().toUpperCase();
  }
}
