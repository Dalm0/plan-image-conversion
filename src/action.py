import xml.etree.ElementTree as ET


def _read_text(root, tag_name, default=""):
    node = root.find(tag_name)
    if node is None or node.text is None:
        return default
    return node.text.strip()


class Action:
    def __init__(self, xml_action):
        root = ET.fromstring(xml_action) if isinstance(xml_action, str) else xml_action

        self.name = _read_text(root, "Name").strip('"')
        self.id = _read_text(root, "Id")
        self.parent = _read_text(root, "Parent")
        self.student = _read_text(root, "Student")

        predecessors = root.find("Predecessors")
        if predecessors is None:
            self.predecessor = []
        else:
            self.predecessor = [child.find("Id").text for child in predecessors if child.find("Id") is not None and child.find("Id").text is not None]

        preconds = root.find("Preconds")
        self.precondition = [child.text.strip()[1:-1] for child in preconds if child.text is not None and child.text.strip()] if preconds is not None else []

        positive_effects = root.find("PositiveEffects")
        self.positiveEffects = [child.text.strip()[1:-1] for child in positive_effects if child.text is not None and child.text.strip()] if positive_effects is not None else []

        negative_effects = root.find("NegativeEffects")
        self.negativeEffects = [child.text.strip()[1:-1] for child in negative_effects if child.text is not None and child.text.strip()] if negative_effects is not None else []