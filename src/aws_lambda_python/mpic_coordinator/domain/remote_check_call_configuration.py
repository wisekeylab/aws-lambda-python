from aws_lambda_python.mpic_coordinator.domain.check_type import CheckType


class RemoteCheckCallConfiguration:
    def __init__(self, check_type: CheckType, perspective: str, lambda_arn: str, input_args: dict):
        self.check_type = check_type
        self.lambda_arn = lambda_arn
        self.perspective = perspective
        self.input_args = input_args  # TODO replace dict with dataclass; better type safety
