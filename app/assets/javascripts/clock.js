$(function(){
  //cache some selectors

  var clock = $('#clock'),
      alarm = clock.find('.alarm'),
      ampm = clock.find('.apmpm');
    //Map digits to their names with an array
    var digit_to_name = 'zero one two three four five six seven eight nine'.split(' ');

    //this object will hold the digit elements
    var digits = {};

    //positions for the hours, minutes, and seconds
    var positions = ['h1', 'h2', ':', 'm1', 'm2', ':', 's1', 's2' ];

    //Generate the digits with the needed markup, and add them to the clock
    var digit_holder = clock.find('.digits');

    $.each(positions, function(){
      if(this == ':'){
        digit_holder.append('<div class="dots">');
      } else {
        var pos = $('<div>');
        for(var i=1; i<8; i++){
          pos.append('<span class="d'+i+'">');
        }
        //Set the digits as key:value pairs in the digits object
        digits[this] = pos;

        //add the digit elements to the page
        digit_holder.append(pos);
      }
    });
    //add the weekday names
    var weekday_names = 'MON TUE WED THU FRI SAT SUN'.split(' '),
        weekday_holder = clock.find('.weekdays');

    $.each(weekday_names, function(){
      weekday_holder.append('<span>'+this+'</span>');
    });

    var weekdays = clock.find('.weekdays span');

    //run a timer every second and update the clock
    (function update_time(){
      //use moment.js to ouput the current time as a string
      //hh is for the hours in a 12 hour format
      //mm - minutes, ss - seconds (all with leading zeros),
      //d is for day of the week and A is for AM/PM
      var now = moment().format("hhmmssdA");

      digits.h1.attr('class', digit_to_name[now[0]]);
      digits.h2.attr('class', digit_to_name[now[1]]);
      digits.m1.attr('class', digit_to_name[now[2]]);
      digits.m2.attr('class', digit_to_name[now[3]]);
      digits.s1.attr('class', digit_to_name[now[4]]);
      digits.s2.attr('class', digit_to_name[now[5]]);

      //The library returns Sunday as the first day of the week. 
      //stupid, so lets shift all the days one position down and make sunday last

      var dow = now[6];
      dow--;

      //Sunday
      if(dow <0 ){
        //make it last 
        dow = 6;
      }
      //Mark the active day of the week
      weekdays.removeClass('active').eq(dow).addClass('active');

      //Set up the AM/PM text
      ampm.text(now[7]+now[8]);

      //schedule this function to be run again in 1 second
      setTimeout(update_time, 1000);
    })();
    //switch the theme
    $('a.button').click(function(){
      clock.toggleClass('light dark');
    });

});