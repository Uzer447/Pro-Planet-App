Expanded(
  child: ListView(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Colors.lightBlue,
              Colors.blue,
              Colors.green,
              Colors.yellowAccent,
            ],
            stops: [0.1, 0.2, 0.5, 0.75],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(90),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Tips',
              style: TextStyle(
                fontSize: 40,
                letterSpacing: 3.0,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          '1- Fill your pencil case with good karma by filling it with pens and other stationary made from post-consumer waste.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          '2- Recycle, recycle, recycle!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          '3- Use sustainable transport  ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          '4- Reduce your power usage',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  ),
),