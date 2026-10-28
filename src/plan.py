import re
import xml.etree.ElementTree as ET
from action import Action

class Plan:
    def __init__(self, plan_description):
        self.plan_name = plan_description
        self.actions = []

        with open(plan_description, "r", encoding="utf-8") as f:
            content = f.read()

        start_positions = []
        start = 0
        while True:
            index = content.find(";;(:metadata", start)
            if index == -1:
                break
            start_positions.append(index)
            start = index + len(";;(:metadata")

        if not start_positions:
            return

        for idx, next_idx in zip(start_positions, start_positions[1:] + [len(content)]):
            raw_block = content[idx + len(";;(:metadata"):next_idx].strip()
            if not raw_block:
                continue

            raw_block = raw_block.lstrip()
            raw_block = raw_block.strip(" )")
            raw_block = re.sub(r"<FFheuristic>.*?</FFheuristic>", "", raw_block, flags=re.DOTALL)
            raw_block = raw_block.strip()

            if not raw_block or not raw_block.startswith("<Action>"):
                continue

            try:
                root = ET.fromstring(raw_block)
            except ET.ParseError:
                continue

            self.actions.append(Action(ET.tostring(root, encoding="unicode")))

    def __str__(self):
        result = f"Plan name: {self.plan_name}\n"
        result += "Actions:\n"
        for action in self.actions:
            result += f" - {action.name.lower()} - {action.precondition} -> {action.positiveEffects} / {action.negativeEffects}\n"
        return result