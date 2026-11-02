from flask import Flask, render_template, request, jsonify
import serial
import time

app = Flask(__name__)

# 아두이노 시리얼 연결
arduino = serial.Serial("COM3", 9600, timeout=1)

# 아두이노 초기화 대기
time.sleep(2)


@app.route("/")
def home():
    return render_template("index.html")

@app.route("/ledControl", methods=["POST"])
def led_control():
    data = request.get_json(silent=True) or {}
    command = data.get("command")

    if command == "on":
        arduino.write(b"on\n")
        print("LED ON 명령 전송")

    elif command == "off":
        arduino.write(b"off\n")
        print("LED OFF 명령 전송")

    else:
        return jsonify({
            "message": "잘못된 명령입니다."
        }), 400

    return jsonify({
        "message": f"아두이노에 {command} 명령을 전송했습니다."
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True, use_reloader=False)