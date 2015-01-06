require 'watir-webdriver'
require 'headless'

headless = Headless.new
headless.start

# classes to watch
# noinspection RubyStringKeysInHashInspection
$classes = { 'ENG 101-009' => '1234567890',
             'BUS 350-002' => '##########' }   #

# don't touch this
$sent_text = {}

# CHANGE THESE VALUES
$opus_username = '<YOUR USERNAME>'
$opus_password = '<YOU PASSWORD>'

$textnow_username = '<YOUR USERNAME>'
$textnow_password = '<YOUR PASSWORD>'

# get texts to this number whenever other peoples' classes open
$my_number = '<YOUR NUMBER>'

def driver
  while true do
    opus_script
  end

  return true
end

def opus_script
  rescues = 0
  begin
    # open firefox and navigate to OPUS
    b = Watir::Browser.new

    b.goto('www.opus.emory.edu')

    b.text_field(:id => 'userid').wait_until_present

    # login
    b.text_field(:id => 'userid').set $opus_username
    b.send_keys :tab
    b.text_field(:name => 'pwd').set $opus_password

    b.button(:id => 'loginbutton').click

    until b.title == 'Employee-facing registry content' do sleep 1 end

    50.times do
      # go to shopping cart
      b.goto('https://saprod9.emory.edu/psp/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?FolderPath=PORTAL_ROOT_OBJECT.CO_EMPLOYEE_SELF_SERVICE.HCCC_ACAD_PLANNING.HC_SSR_SSENRL_CART_GBL2&IsFolder=false&IgnoreParamTempl=FolderPath%2cIsFolder')

      # does not have code to choose between multiple semesters

      sleep 3

      num_class = 0
      search = "win0divP_CLASS_NAME$#{num_class}"
      iframe = b.iframe(:id => 'ptifrmtgtframe') # tricky business...

      # search through the classes to find if open classes correspond to ones that are being watched
      while iframe.div(:id => search).exist? do
        if iframe.div(:id => "win0divDERIVED_REGFRM1_SSR_STATUS_LONG$#{num_class}").img.alt == 'Open'
          class_name = iframe.div(:id => search).text.split("\n").first
          if $classes[class_name] &&  !$sent_text[class_name]
            sendText($classes[class_name], class_name)
            $sent_text[class_name] = true
          end
        end
        num_class += 1
        search = "win0divP_CLASS_NAME$#{num_class}"
      end

      sleep 30
    end

    $sent_text.clear
    b.close
  rescue Watir::Exception::UnknownObjectException, Watir::Wait::TimeoutError, Timeout::Error
    sleep 5
    rescues += 1
    puts rescues
    b.close
    $sent_text.clear
    if rescues > 5
      sendText($my_number, 'Broken')
    end
    retry
  end
end

def sendText(number, class_name)
  closeDialog = true
  bText = Watir::Browser.new
  bText.driver.manage.timeouts.implicit_wait = 15
  bText.goto('www.textnow.com')

  bText.text_field(:id => 'username').wait_until_present
  bText.text_field(:id => 'username').set $textnow_username
  bText.text_field(:id => 'password').set $textnow_password
  bText.button(:value => 'Login').click

  sleep 15

  begin
    close_button = bText.button(:class => 'closeDialogX')
    close_button.wait_until_present
  rescue Watir::Wait::TimeoutError
    closeDialog = false
  end

  close_button.click if closeDialog

  bText.button(:id => 'newText').wait_until_present
  bText.button(:id => 'newText').click

  bText.text_field(:id => 'contact').wait_until_present
  bText.text_field(:id => 'contact').set number
  if class_name == 'CS 599R-VIGF'
    bText.text_field(:id => 'message').set 'STILL WORKING'
  elsif class_name == 'Broken'
    bText.text_field(:id => 'message').set 'Is broked. Somebody come fix me...'
  else
    bText.text_field(:id => 'message').set "Class Alert Bot: You're #{class_name} class is open! :D"
  end

  bText.button(:class => 'form_button_primary').wait_until_present
  bText.button(:class => 'form_button_primary').click

  sleep 4

  if number != $my_number
    bText.button(:id => 'newText').wait_until_present
    bText.button(:id => 'newText').click

    bText.text_field(:id => 'contact').wait_until_present
    bText.text_field(:id => 'contact').set $my_number
    bText.text_field(:id => 'message').set "Class Alert Bot: Somebody's #{class_name} class is open!"

    bText.button(:class => 'form_button_primary').wait_until_present
    bText.button(:class => 'form_button_primary').click
  end

  bText.link(:id => 'signout-link').click

  sleep 4

  bText.close
end

driver

headless.destroy